module FullContact
  class Client
    # Public: Methods for interacting with icon endpoint
    module Icon
      # Public: Provies url to different social media icons. All icons are
      # 24 bit PNG and come in 4 different sizes. Allows you to quickly
      # incorporate social network icons into FullContact powered your apps.
      # see http://www.fullcontact.com/docs/?category=icon for list of
      # available icons
      #
      # type_id - String name of the icon you want. (default: 'facebook')
      # size    - The size parameter allows you to specify the size of icon
      #           that you want. Icons are available in 16, 24, 32 and 64
      #           pixels square. (default: '32')
      # style   - Allows to pick from available styles of icon
      #           (default: 'default')
      #
      # Example
      #
      #   angel_list_icon = FullContact.get_social_icon_url('angellist','16','default')
      #   # 'angel_list_icon' contains url of the icon
      #
      # Returns url to the specified social media icon
      def get_social_icon_url(type_id = 'facebook', size = '32', style = 'default')
        self.format = ''
        url = '/' + type_id + '/' + size + '/' + style
        response = get('icon' + url, {}, true)
        response.env[:response_headers]['location']
      end
      
    end
    
  end
  
end