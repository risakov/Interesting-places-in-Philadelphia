module Trello
  # An Item is a basic task that can be checked off and marked as completed.
  #
  # @!attribute [r] id
  #   @return [String]
  # @!attribute [r] name
  #   @return [String]
  # @!attribute [r] type
  #   @return [Object]
  # @!attribute [r] state
  #   @return [Object]
  # @!attribute [r] pos
  #   @return [Object]
  class Item < BasicData
    register_attributes :id, :name, :type, :state, :pos, readonly: [ :id, :name, :type, :state, :pos ]
    validates_presence_of :id, :type

    # Updates the fields of an item.
    #
    # Supply a hash of string keyed data retrieved from the Trello API representing
    # an item.
    def update_fields(fields)
      attributes[:id]           = fields['id'] || attributes[:id]
      attributes[:card_id]      = fields['idCard'] || attributes[:card_id]
      attributes[:checklist_id] = fields['idChecklist'] || attributes[:checklist_id]
      attributes[:name]         = fields['name'] || attributes[:name]
      attributes[:type]         = fields['type'] || attributes[:type]
      attributes[:state]        = fields['state'] || attributes[:state]
      attributes[:pos]          = fields['pos'] || attributes[:pos]
      self
    end

    def complete?
      state == "complete"
    end
  end
end
