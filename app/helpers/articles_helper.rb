module ArticlesHelper
  def date_format(datetime)
    datetime.strftime '%B %e, %Y'
  end
end
