describe Dao::Entity::Base do
  let(:attributes) do
    {
      id: 1,
      name: 'Article',
      comments: [
        {
          user_name: 'user',
          body: 'Body'
        }
      ]
    }
  end

  describe 'attributes' do
    let(:post) { Post.new(attributes) }

    subject { post }

    its(:id) { is_expected.to eq 1 }
    its(:name) { is_expected.to eq 'Article' }
    its(:comments) { is_expected.to contain_exactly(instance_of(Comment)) }

    describe '#comments' do
      subject { post.comments.first }

      its(:user_name) { is_expected.to eq 'user' }
      its(:body) { is_expected.to eq 'Body' }
    end
  end

  describe '#initialized_with' do
    describe 'default value' do
      subject { Post.new({}) }

      its(:initialized_with) { is_expected.to eq [] }
    end

    describe 'defined value' do
      subject { Post.new({}).tap { |p| p.initialized_with = [:comments] } }

      its(:initialized_with) { is_expected.to eq [:comments] }
    end
  end

  describe '#persisted?' do
    context 'when have id' do
      subject { Post.new(id: 1) }

      its(:persisted?) { is_expected.to be_truthy }
    end

    context 'when have not id' do
      subject { Post.new({}) }

      its(:persisted?) { is_expected.to be_falsey }
    end
  end

  describe '#to_key' do
    context 'when have id' do
      subject { Post.new(id: 1) }

      its(:to_key) { is_expected.to eq [1] }
    end

    context 'when have not id' do
      subject { Post.new({}) }

      its(:to_key) { is_expected.to be_nil }
    end
  end

  describe '#entity_state' do
    let(:post) { Post.new(attributes) }

    subject { post.entity_state }

    its(:name) { is_expected.to eq 'Article' }
    its(:name_changed?) { is_expected.to be_falsey }
    its(:name_was) { is_expected.to eq 'Article' }
  end
end
