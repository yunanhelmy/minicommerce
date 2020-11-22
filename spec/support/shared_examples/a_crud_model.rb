shared_examples 'a crud model' do |factory: nil, creates: {}, updates: {}|
  subject { build factory } if factory

  describe "creation" do
    it "Valid" do
      instance = described_class.create(attributes_for(factory).merge(creates))
      expect(instance).to be_valid
    end
  end

  describe "changes" do
    it "Valid attributes" do
      expect(subject).to be_valid

      subject.update(attributes_for(factory))
      expect(subject).to be_valid
    end
  end

  describe "deletion" do
    it "deleted" do
      expect(subject).to be_valid

      d = subject.destroy
      expect(d.destroyed?).to eq(true)
    end
  end

end
