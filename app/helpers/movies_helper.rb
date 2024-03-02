module MoviesHelper
    def star_rating(rating)
        output = ''
        full_stars = rating.floor
        half_star = rating - full_stars >= 0.5 ? 1 : 0
        empty_stars = 5 - full_stars - half_star
    
        full_stars.times { output += fa_icon('star', class: 'star-full') }
        half_star.times { output += fa_icon('star-half-alt', class: 'star-half') }
        empty_stars.times { output += fa_icon('star', class: 'star-empty') }
    
        output.html_safe
    end
    
    def fa_icon(icon_name, options = {})
    classes = "fas fa-#{icon_name} #{options[:class]}"
    "<i class='#{classes}'></i>"
    end
end
