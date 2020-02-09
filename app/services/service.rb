class Service < SingleActionService::Base
  DEFAULT_ERROR = ErrorCodes::ERROR

  def error_code(code = DEFAULT_ERROR)
    error(code: code)
  end

  def fields_error(fields, code = DEFAULT_ERROR)
    error(data: { fields: fields }, code: code)
  end

  def field_error(field_name, text, code = DEFAULT_ERROR)
    fields_error({ field_name => [text] }, code)
  end

  def object_error(object, code = DEFAULT_ERROR)
    error(data: object.errors.detailed_messages(wrap_attributes_to: :fields),
          code: code)
  end

  def form_error(object, code = ErrorCodes::FORM)
    object_error(object, code)
  end
end
