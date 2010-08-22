require File.expand_path(File.dirname(__FILE__) + '/../test_helper')
require File.expand_path(File.dirname(__FILE__) + '/../data/models')

class LocaleSpecificAttributesTest < ActiveSupport::TestCase
  def setup
    I18n.locale = :en
    reset_db!
    ActiveRecord::Base.locale = nil
  end

  test "locale specific writers" do
    post = Post.create(:subject_en => "en subject", :content_en => "en content",
                       :subject_en_us => "en-US subject", :content_en_us => "en-US content",
                       :subject_de => "de subject", :content_de => "de content")

    assert_equal 3, PostTranslation.count

    I18n.locale = :'en-US'
    assert_equal 'en-US subject', post.subject

    I18n.locale = :en
    assert_equal 'en subject', post.subject

    I18n.locale = :de
    assert_equal 'de subject', post.subject

    I18n.locale = :'de-DE'
    # TODO: Assuming no fallbacks here.  Test suite needs a way to test with or without fallbacks
    assert_nil post.subject
  end

  test "blank translation deletion for new object" do
    post = Post.create(:subject_en => "en subject", :content_en => "en content",
                       :subject_de => "", :content_de => "")

    assert_equal 1, post.translations(true).size
    assert_nil post.translations.detect{ |t| t.locale == :'de' }
  end

  test "blank translation deletion for existing object" do
    post = Post.create(:subject_en => "en subject", :content_en => "en content",
                       :subject_de => "de subject", :content_de => "de content")

    post.update_attributes(:subject_de => '', :content_de => '')

    assert_equal 1, post.translations(true).size
    assert_nil post.translations.detect{ |t| t.locale == :'de' }
  end

  test "blank non-dependent translation deletion for new object" do
    post_revision = PostRevision.create(:subject_en => "en subject", :content_en => "en content",
                                        :subject_de => "", :content_de => "")

    assert_equal 1, PostRevision::Translation.count
    assert_nil post_revision.translations.detect{ |t| t.locale == :'de' }
  end

  test "blank non-dependent translation deletion for existing object" do
    post_revision = PostRevision.create(:subject_en => "en subject", :content_en => "en content",
                                        :subject_de => "de subject", :content_de => "de content")

    post_revision.update_attributes(:subject_de => '', :content_de => '')

    assert_equal 1, PostRevision::Translation.count
    assert_nil post_revision.translations.detect{ |t| t.locale == :'de' }
  end

  test "locale specific readers" do
    post = Post.create(:subject_en => "en subject", :content_en => "en content",
                       :subject_en_us => "en-US subject", :content_en_us => "en-US content",
                       :subject_de => "de subject", :content_de => "de content")
    post.reload

    assert_equal 'en-US subject', post.subject_en_us
    assert_equal 'en subject', post.subject_en
    assert_equal 'de subject', post.subject_de
    assert_nil post.subject_es
  end

  test "locale specific readers dont use fallbacks" do
    post = Post.create(:subject_en => "en subject", :content_en => "en content",
                       :subject_de => "de subject", :content_de => "de content")
    post.reload

    # TODO: Enable this with fallbacks detection
    if I18n.respond_to?(:fallbacks)
      I18n.locale = :'en-US'
      assert_equal 'en subject', post.subject
      assert_nil post.subject_en_us
    end
  end

  test "writer updates default reader immediately" do
    I18n.locale = :'en-US'
    post = Post.create(:subject => 'Original Title')
    assert_equal 'Original Title', post.subject

    post.subject_en_us = "New Title"

    assert_equal "New Title", post.subject, "default reader does not see updated title"
  end

  test "writer updates locale-specific reader immediately" do
    I18n.locale = :'en-US'
    post = Post.create(:subject => 'Original Title')
    assert_equal 'Original Title', post.subject_en_us

    post.subject_en_us = "New Title"

    assert_equal "New Title", post.subject_en_us, "locale specific reader does not see updated title"
  end

  test "writer updates translations association target immediately" do
    I18n.locale = :'en-US'
    post = Post.create(:subject => 'Original Title')
    assert_equal 'Original Title', post.translations.detect{ |t| t.locale == :'en-US' }.subject

    post.subject_en_us = "New Title"

    assert_equal "New Title", post.translations.detect{ |t| t.locale == :'en-US' }.subject, "translations association does not see updated title"
  end
end