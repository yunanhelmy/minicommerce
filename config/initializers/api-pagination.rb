Pagy::VARS[:max_per_page] = 30
Pagy::VARS[:items] = 30

ApiPagination.configure do |config|
  config.paginator = :pagy

  config.page_param = :page

  config.per_page_param = :per_page

  config.total_header = 'X-Total'

  config.per_page_header = 'X-Per-Page'

  config.page_header = 'X-Page'

  config.include_total = true
end
