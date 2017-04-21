include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { MinBinaryHeap.new(root) }

  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node with a lower rating as the root" do
      heap.insert(heap.root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node with a lower rating as the root and recurs" do
      heap.insert(heap.root, pacific_rim)
      expect(heap.root.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node with a higher rating as a left node" do
      heap.insert(heap.root, shawshank)
      expect(heap.root.left.title).to eq "The Shawshank Redemption"
    end

    it "properly sorts multiple nodes" do
      heap.insert(heap.root, donnie)
      heap.insert(heap.root, inception)
      heap.insert(heap.root, martian)
      expect(heap.root.left.left.title).to eq "The Martian"
    end

    it "properly makes a complete third row in the tree" do
      heap.insert(heap.root, donnie)
      heap.insert(heap.root, pacific_rim)
      heap.insert(heap.root, jedi)
      heap.insert(heap.root, empire)
      heap.insert(heap.root, hope)
      heap.insert(heap.root, mad_max_2)
      heap.print
      expect(heap.root.right.left.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(heap.root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(heap.root, hope)
      heap.delete(heap.root, hope.title)
      expect(heap.find(heap.root, hope.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.insert(heap.root, braveheart)
      heap.insert(heap.root, pacific_rim)
      heap.delete(heap.root, pacific_rim.title)
      expect(heap.find(heap.root, pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      heap.insert(heap.root, donnie)
      heap.insert(heap.root, inception)
      heap.delete(heap.root, inception.title)
      expect(heap.find(heap.root, inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(heap.root, district)
      heap.delete(heap.root, district.title)
      expect(heap.find(heap.root, district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.insert(heap.root, hope)
      heap.insert(heap.root, martian)
      heap.delete(heap.root, martian.title)
      expect(heap.find(heap. root,martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      heap.insert(heap.root, empire)
      heap.insert(heap.root, mad_max_2)
      heap.delete(heap.root, mad_max_2.title)
      expect(heap.find(heap.root, mad_max_2.title)).to be_nil
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(heap.root, empire)
      heap.insert(heap.root, mad_max_2)
      expect(heap.find(heap.root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(heap.root, pacific_rim)
      expect(heap.find(heap.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-left node" do
      heap.insert(heap.root, braveheart)
      heap.insert(heap.root, pacific_rim)
      expect(heap.find(heap.root, pacific_rim.title).title).to eq "Pacific Rim"
    end

    it "properly finds a left-right node" do
      heap.insert(heap.root, donnie)
      heap.insert(heap.root, inception)
      expect(heap.find(heap.root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      heap.insert(heap.root, district)
      expect(heap.find(heap.root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      heap.insert(heap.root, hope)
      heap.insert(heap.root, martian)
      expect(heap.find(heap.root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      heap.insert(heap.root, empire)
      heap.insert(heap.root, mad_max_2)
      expect(heap.find(heap.root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end


  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\n"

       heap.insert(heap.root, hope)
       heap.insert(heap.root, empire)
       heap.insert(heap.root, jedi)
       heap.insert(heap.root, martian)
       heap.insert(heap.root, pacific_rim)
       heap.insert(heap.root, inception)

       expect { heap.print }.to output(expected_output).to_stdout
     }
  end
end
