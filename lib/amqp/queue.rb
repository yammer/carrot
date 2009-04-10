module Carrot::AMQP
  class Queue
    attr_reader :name, :server
    attr_accessor :delivery_tag

    def initialize(server, name, opts = {})
      @server = server
      @opts   = opts
      @name   = name
      server.send_frame(
        Protocol::Queue::Declare.new({ :queue => name, :nowait => true }.merge(opts))
      )
      nil
    end

    def delete(opts = {})
      server.send_frame(
        Protocol::Queue::Delete.new({ :queue => name, :nowait => true }.merge(opts))
      )
      nil
    end

    def pop(opts = {})
      self.delivery_tag = nil
      server.send_frame(
        Protocol::Basic::Get.new({ :queue => name, :consumer_tag => name, :no_ack => !opts.delete(:ack), :nowait => true }.merge(opts))
      )
      method = server.next_method
      return unless method.is_a?(Protocol::Basic::GetOk)

      self.delivery_tag = method.delivery_tag

      header = server.next_payload
      msg    = server.next_payload
      raise 'unexpected length' if msg.length < header.size

      msg
    end

    def ack
      server.send_frame(
        Protocol::Basic::Ack.new(:delivery_tag => delivery_tag)
      )
    end

    def publish(data, opts = {})
      exchange.publish(data, opts)
    end

    def message_count
      status.first
    end

    def consumer_count
      status.last
    end
    
    def status(opts = {}, &blk)
      server.send_frame(
        Protocol::Queue::Declare.new({ :queue => name, :passive => true }.merge(opts))
      )
      method = server.next_method
      [method.message_count, method.consumer_count]
    end

  private
    def exchange
      @exchange ||= Exchange.new(server, :direct, '', :key => name)
    end
  end
end
