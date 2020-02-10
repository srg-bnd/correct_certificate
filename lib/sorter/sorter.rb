# Sorted

class Sorter
  def initialize(items: nil,
                default_column: 'created_at',
                default_type: :desc,
                available_columns: nil,
                available_types: [:asc, :desc])
    @items = items
    @default_column = default_column
    @default_type = default_type
    @available_columns = available_columns
    @available_types = available_types
  end

  def call(column: nil,
           type: nil,
           add_id: false)
    @type = init_type(type)
    @column = init_column(column)
    column_list = init_column_list(@column, add_id)
    @items.order(column_list)
  end

  private

  def init_type(type)
    type = type&.to_sym
    return @default_type if @available_types.exclude?(type)

    type
  end

  def init_column(column)
    return @default_column if @available_columns.exclude?(column)

    column
  end

  def init_column_list(column, add_id)
    {
      init_column_with_table(column) => @type,
      id: (@type if add_id)
    }.compact
  end

  def init_column_with_table(column)
    # If table name is not set, set it
    return column unless column.split('.').size == 1

    "#{@items.table_name}.#{column}"
  end
end
