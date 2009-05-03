require 'test_helper'

class PresentationsControllerTest < ActionController::TestCase

  should_route :get, '/presentations',
    :controller => 'presentations', :action => 'index'

  should_route :post, '/presentations',
    :controller => 'presentations', :action => 'create'

  should_route :get, '/presentations/1/edit',
    :controller => 'presentations', :action => 'edit', :id => '1'

  should_route :put, '/presentations/1',
    :controller => 'presentations', :action => 'update', :id => '1'

  should_route :delete, '/presentations/1',
    :controller => 'presentations', :action => 'destroy', :id => '1'

  context 'A GET to index' do
    setup { get :index }

    should_respond_with :success
    should_assign_to :presentations
  end

  context 'on GET to new' do
    setup { get :new }

    should_assign_to :presentation
    should_respond_with :success
    should_render_template :new

    should 'have a form to create a new Presentation' do
      assert_select 'form[id=new_presentation][action=/presentations]' do
        should_have_presentation_form_fields
      end
    end
  end

  context 'A POST to /presentations' do
    setup do
      @old_count = Presentation.count
      post :create, :presentation => Factory.attributes_for(:presentation)
    end

    should 'create a presentation' do
      assert_equal @old_count + 1, Presentation.count
    end

    should_redirect_to("presentations index") { presentations_path }
  end

  context 'A GET to /presentations/:id/edit' do
    setup do
      @presentation = Factory(:presentation)
      get :edit, :id => @presentation.to_param
    end

    should_respond_with :success
    should_render_template :edit

    should 'have a form to create a new Presentation' do
      assert_select "form[id=edit_presentation_#{@presentation.to_param}][action=/presentations/#{@presentation.to_param}]" do
        should_have_presentation_form_fields
      end
    end
  end

  context 'A PUT to /presentations/:id' do
    setup do
      @presentation = Factory(:presentation)
      put :update, :id => @presentation.id, :presentation => { :title => 'updated_recommendable' }
    end

    should 'update presentation' do
      assert_not_equal @presentation.title, Presentation.find_by_id(@presentation.id).title
    end

    should_redirect_to("presentations index") { presentations_path }
  end

  context 'A DELETE to /presentations/:id' do
    setup do
      @presentation   = Factory(:presentation)
      @old_count = Presentation.count
      delete :destroy, :id => @presentation.id
    end

    should 'destroy presentation' do
      assert_equal @old_count - 1, Presentation.count
    end

    should 'show flash notice' do
      assert_equal 'Presentation was successfully deleted.', flash[:notice]
    end

    should_redirect_to("presentations index") { presentations_path }
  end

  protected

  def should_have_presentation_form_fields
    assert_select 'input[id=presentation_title][type=text]'
    assert_select 'input[id=presentation_url][type=text]'
    assert_select 'input[id=presentation_submit][type=submit]'
  end

end
