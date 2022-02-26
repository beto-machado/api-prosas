module RenderMeta
  protected

  def meta_attributes(collection, extra_meta = {})
    {
      current_page: collection.current_page,
      next_page: collection.next_page,
      total_page: collection.total_pages,
      total_items: collection.length
    }.merge(extra_meta)
  end
end
