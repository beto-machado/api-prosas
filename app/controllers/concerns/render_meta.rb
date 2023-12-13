# frozen_string_literal: true

module RenderMeta
  protected
    def meta_attributes(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        total_page: collection.total_pages,
        total_items_per_page: collection.length,
        total_items: Proposta.count
      }.merge(extra_meta)
    end
end
