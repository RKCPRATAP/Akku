trigger AccountTrigger on Account (before insert,before update, before delete, 
                                    after insert, after update, after delete, after undelete) {
    List<Id> accIds = new List<Id>();
    for (Account acc : trigger.new) {
        accIds.add(acc.Id);
    }
    List<Contact> conList = [Select id, phone from Contact where AccountId IN:accIds ];
    List<Contact> conToBeUpdate = new List<Contact>();
    for(Contact c: conList){
        c.phone= '0000';
        conToBeUpdate.add(c);
    }
    update conToBeUpdate;

    }