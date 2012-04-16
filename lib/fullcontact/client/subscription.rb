module FullContact
  class Client
    module Subscription
      # Public: Creates a subscription to a contactList in order to receive webhook notifications for certain events
      #
      # list_id - id of the contact list for which subscription is to be created
      # options - hash containing additional arguments
      #           :event Type of event. Only 'enriched' is supported right now
      #           :callback Callback URL to post to when event occurs
      #
      # Example
      #
      #   response = FullContact.create_subscription(list_id, {:event => 'enriched', :callback => callback_url })
      #   response.id contains the subscription id
      def create_subscription(list_id, options)
        post("contactList/#{list_id}/subscribe", options)
      end

      # Public: Lists all subscriptions associated with a contactList
      #
      # list_id - id of the contact list for which subscription is to be created
      #
      # Example
      #
      #   response = FullContact.list_subscriptions(list_id)
      #   response.subscriptions contains list of all subscriptions for this contact list
      def list_subscriptions(list_id)
        get("contactList/#{list_id}/subscribe")
      end

      # Public: Delete a subscription associated with a contactList
      #
      # list_id - id of the contact list for which subscription is to be created
      # options - hash containing additional arguments
      #           :subscription id of the subscription to delete
      #
      # Example
      #
      #   response = FullContact.delete_subscriptions(list_id, {:subscription => subscription_id})
      def delete_subscription(list_id, options)
        delete("contactList/#{list_id}/subscribe", options)
      end
    end
  end
end
