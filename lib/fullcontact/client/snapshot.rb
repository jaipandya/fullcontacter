module FullContact
  class Client
    module Snapshot
      # Public: Creates a snapshot in order to store a point-in-time backup of a contactList
      #
      # list_id - id of the contact list to be backed-up
      # options - hash containing additonal arguments
      #           :name - Name of the snapshot
      #
      # Example
      #
      #   response = FullContact.create_snapshot(list_id, {:name => 'foo'})
      #   response.result now contains the snapshot name and timestamp
      def create_snapshot(list_id, options)
        post("contactList/#{list_id}/snapshot", options)
      end

      # Public: List all snapshots associated with a contact list
      #
      # list_id - id of the contact list for which snapshots need to be fetched
      #
      # Example
      #
      #   response = FullContact.list_snapshots(list_id)
      #   response.snapshots gives a list of snapshot names
      def list_snapshots(list_id)
        get("contactList/#{list_id}/snapshot")
      end
    end
  end
end
