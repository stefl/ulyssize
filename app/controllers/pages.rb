Ulyssize.controllers :pages do
  
  get :index, :map => "/" do
    @page = Page.all.skip(rand(Page.all.count-1)).first
    render :"pages/show"
  end

  get :show, :map => "/pages/:id" do
    @page = Page.find(params[:id])
    render :"pages/show"
  end

  get :random, :map => "/new" do
    @page = Page.all.skip(rand(Page.all.count-1)).first
    redirect url_for(:pages, :show, :id => @page.id )
  end
  
  get :generate, :map => "/generate" do
    page_text = Markov.new.generate_page("ulysses_ascii.txt")
    @page = Page.create(:body => page_text)
    redirect url_for(:pages, :show, :id => @page.id )
  end
  
end
