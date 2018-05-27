class MinTwoWordsAndDotValidator < ActiveModel::EachValidator

  FIRST_UPCASE_REGEX = /[[:upper:]]+[[:alpha:]]+\.*( +[[:alpha:]]{2,}\.*){1,}/
  ALL_UPCASE_REGEX = /[[:upper:]]+[[:alpha:]]+\.*( +[[:upper:]]+[[:alpha:]]+\.*){1,}/

  def validate_each(record, attribute, value)
    format_regex = options.key?(:all_upcase) ? ALL_UPCASE_REGEX : FIRST_UPCASE_REGEX

    record.errors.add(attribute, 'is invalid') unless (value =~ format_regex) && (value =~ /\./)
  end
end