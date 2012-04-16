module FullContact
  class Client
    # Public: Various methods related to name of the person
    module Name
      # Public: Takes quasi structured name data provided as a string and
      # outputs the data in a structured manner.
      #
      # query - Query parameter allows you to pass a quasi-structured full
      #         name String which can include standard prefix, first name,
      #         nickname, middle name, last name and suffix. 
      #
      # Example
      #
      #   normalized = FullContact.normalize('John Smith')
      #   # 'normalized' contains normalized contact
      #
      # Returns normalized contact
      def normalize(query)
        options = {:q => query}
        get('name/normalizer', options)
      end
      
      # Public: Attempts to deduce a structured name from email address. It
      # also returns a likelihood based on US population data. This method is
      # ideal for business email addresses due to the use of standard
      # convention in corporate email address formats.
      #
      # email - email parameter allows to pass an email address as String
      #
      # Example
      #
      #   deduced = FullContact.deduce_by_email('johndsmith79@business.com')
      #   # 'deduced' contains deduced contact
      #
      # Returns deduced contact
      def deduce_by_email(email)
        options = {:email => email}
        get('name/deducer', options)
      end
      
      # Public: Attempts to deduce a structured name from username. It
      # also returns a likelihood based on US population data.
      #
      # email - username parameter allows to pass username as String
      #
      # Example
      #
      #   deduced = FullContact.deduce_by_username('johndsmith79')
      #   # 'deduced' contains deduced contact
      #
      # Returns deduced contact
      def deduce_by_username(username)
        options = {:username => username}
        get('name/deducer', options)
      end
      
      # Public: The Name Similarity endpoint compares two names, given as the
      # parameters q1 and q2, and returns a score indicating how similar they
      # are. As the performance of different similarity algorithms can vary
      # over different data sets, the endpoint provides 3 separate choices. 
      #
      # name_one - String first name to compare
      # name_two - String second name to compare
      #
      # Example
      #
      #   similarity = FullContact.similarity('john','johnathan')
      #   # 'normalized' contains similarity of contact
      #
      # Returns similarity in the contact
      def similarity(name_one, name_two)
        options = {
          :q1 => name_one,
          :q2 => name_two
        }
        get('name/similarity', options)
      end
      
      # Public: The method can be used when you only know a single name and
      # you are uncertain whether it is the given name or family name. 
      #
      # name - String first name or last name of person about which you are
      #        uncertain.
      #
      # Example
      #
      #   stats = FullContact.stats_by_name('John')
      #   # 'stats' contains stats about the contact
      #
      # Returns stats about the contact
      def stats_by_name(name)
        options = {:name => name}
        get('name/stats', options)
      end
      
      
      # Public: The method can be used when you know that the name is a given name (first name).
      #
      # given_name - String parameter allows to pass given_name of the person
      #
      # Example
      #
      #   stats = FullContact.stats_by_given_name('john')
      #   # 'stats' contains stats about the contact
      #
      # Returns stats about the contact
      def stats_by_given_name(given_name)
        options = {:givenName => given_name}
        get('name/stats', options)
      end
      
      # Public: The method can be used when you know that the name is a family
      # name (last name). 
      #
      # family_name - String family name of the person
      #
      # Example
      #
      #   stats = FullContact.stats_by_family_name('smith')
      #   # 'stats' contains stats about the contact
      #
      # Returns stats about the contact
      def stats_by_family_name(family_name)
        options = {:familyName => family_name}
        get('name/stats', options)
      end
      
      # Public: The method can be use when you know both first name and last
      # name of the person
      #
      # given_name  - String first name of the person
      # family_name - String last name of the person
      #
      # Example
      #
      #   stats = FullContact.stats_by_given_and_family_name('john', 'smith')
      #   # 'stats' contains stats about the contact
      #
      # Returns stats about the contact
      def stats_by_given_and_family_name(given_name, family_name)
        options = {
          :givenName => given_name,
          :familyName => family_name
        }
        get('name/stats', options)
      end
      
      # Public: The Name Parser method can be used when you have two names but
      # don't know which one is the first name and which is the last name.
      #
      # name - String name parameter allows you to pass an ambiguious name and
      #        determine what the given name and family name is.  
      #
      # Example
      #
      #   parsed = FullContact.parse('Smith Jon')
      #   # 'parsed' contains parsed contact
      #
      # Returns parsed contact
      def parse(name)
        options = {:q => name}
        get('name/parser', options)
      end
      
    end
  end
end
