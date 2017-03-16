include RSpec

require_relative 'myqueue'

RSpec.describe MyQueue, type: Class do
  let(:queue) { MyQueue.new }

  describe "#enqueue" do
    it "pushes an item into the head of the queue" do
      queue.enqueue("Rob")
      expect(queue.head).to eq "Rob"
      expect(queue.tail).to eq "Rob"
      queue.enqueue("Ben")
      expect(queue.head).to eq "Ben"
      expect(queue.tail).to eq "Rob"
    end
  end

  describe "#dequeue" do
    it "removes an item from the end of the queue" do
      queue.enqueue("Rob")
      expect(queue.empty?).to eq false
      queue.dequeue
      expect(queue.empty?).to eq true
    end

    it "updates the head and tail accessors properly" do
      queue.enqueue("Rob")
      expect(queue.head).to eq "Rob"
      expect(queue.tail).to eq "Rob"
      queue.enqueue("Ben")
      expect(queue.head).to eq "Ben"
      expect(queue.tail).to eq "Rob"
    end
  end

  describe "#empty?" do
    it "returns true if the queue is emtpy" do
      expect(queue.empty?).to eq true
    end

    it "returns false if the queue is not empty" do
      queue.enqueue("Rob")
      expect(queue.empty?).to eq false
    end
  end
end