class Scraper

  def self.list_recipes(ingredient)
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    recipes = []
    doc.search('.m_contenu_resultat').each do |element|
      name = element.search('.m_titre_resultat a').first.text.strip
      description = element.search('.m_texte_resultat').first.text.strip
      cooking_time = element.search('.m_detail_time div').first
      cooking_time = cooking_time.nil? ? "Unavaliable" : cooking_time.text.strip
      difficult_str = element.search('.m_detail_recette').first.text

      difficult = ['Very easy', 'Easy', 'Moderate', 'Difficult'].select{ |d| difficult_str.include?(d) }.first

      recipes << {name: name, description: description, cooking_time: cooking_time, difficult: difficult}
    end

    return recipes

  end
end