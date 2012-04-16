module FullContact
  class Client
    module ContactList
      # Public: Creates a contact list for the authenticating user
      #
      # options - a Hash containing the alias(optional) for the new list
      #
      # Example
      #
      #   list = FullContact.create_contact_list(:alias => 'dummy')
      #   # 'list' contains the newly created contact list
      def create_contact_list(options = {})
        post('contactLists', options)
      end

      # Public: Deletes a contact list of the authenticating user
      #
      # list_id - id of the list object to be deleted
      #
      # Example
      #
      #   list = FullContact.create_contact_list(:alias => 'dummy')
      #   # Delete this list now...
      #   FullContact.delete_contact_list(list.list_id)
      def delete_contact_list(list_id)
        delete("contactLists/#{list_id}")
      end

      # Public: Retrieves all the contact lists for the authenticating user
      #
      # Example
      #
      #   lists = FullContact.get_contact_lists
      #   # Iterate over this list now..
      #   lists.each { |list| puts list.inspect }
      def get_contact_lists
        contact_lists = get('contactLists').lists
        contact_lists.map do |list|
          list.list_id = list.id
        end
        contact_lists
      end

      # Public: Gets the contacts within a contact list
      #
      # list_id - Id of the list from which contacts need to be retrieved
      #
      # Example
      #
      #   lists = FullContact.get_contact_lists
      #   # Get contacts in first list now
      #   FullContacts.get_contacts_in_a_list(lists[0].list_id)
      def get_contacts_in_a_list(list_id, options={})
        get("contactLists/#{list_id}", options)
      end

      # Public: Queues a contact list for enrichment to search for new contact information
      #
      # list_id - Id of the list which needs to be queued for enrichment
      #
      # Example
      #
      #   lists = FullContact.get_contact_lists
      #   # Enrich the contacts in first list
      #   FullContacts.queue_contact_list_for_enrichment(lists[0].list_id)
      def queue_contact_list_for_enrichment(list_id)
        post("contactLists/#{list_id}/queue")
      end

      # Public: Removes all contacts in a contact list
      #
      # list_id - Id of the list from which contacts need to be cleared
      #
      # Example
      #
      #   lists = FullContact.get_contact_lists
      #   # Clear contacts in first list
      #   FullContacts.clear_contact_list(lists[0].list_id)
      def clear_contact_list(list_id)
        post("contactLists/#{list_id}/clear")
      end
    end
  end
end
