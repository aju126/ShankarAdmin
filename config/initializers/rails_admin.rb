RailsAdmin.config do |config|

  config.main_app_name = ["Shankar"]

  config.model 'Customer' do
    list do
      field :first_name
      field :mobile
      field :email
    end

    create do
      field :first_name
      field :last_name
      field :mobile
      field :email
      field :reference
      field :identities do
        associated_collection_cache_all false  # REQUIRED if you want to SORT the list as below
        associated_collection_scope do
          # bindings[:object] & bindings[:controller] are available, but not in scope's block!
          customer = bindings[:object]
          Proc.new { |scope|
            # scoping all Players currently, let's limit them to the team's league
            # Be sure to limit if there are a lot of Players and order them by position
            scope = scope.where(customer_id: customer.id) #if team.present?
            scope = scope.limit(30) # 'order' does not work here
          }
        end
      end
      field :identities
      field :comment
    end

    show do
      field :first_name
      field :last_name
      field :mobile
      field :email
      field :reference
      field :identities #if identities.customer_id.blank?
      field :comment
    end
  end

  config.model 'Group' do
    list do
      field :name
    end
  end


  config.model 'Package' do
    list do
      field :name
      field :group
      field :status
      field :product
    end
  end

  config.model 'Identity' do
    list do
      field :name
      field :document
      field :comments
    end

    show do
      field :name
      field :comments
      include_all_fields
      field :document do
        thumb_method :thumb
      end
    end
  end

  config.model 'Pricing' do

  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
