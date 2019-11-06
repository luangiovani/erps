import { Schema, model } from 'mongoose';

const DeliverOptionSchema = new Schema({
    label: { 
        type: String, 
        required: true
    },
    label_employee: { 
        type: String, 
        required: true
    },
    label_store: { 
        type: String, 
        required: true
    },
    active: {
        type: Boolean,
        required: true
    },
    creation_date_time: {
        type: Date,
        required: true
    },
    creation_employee_id: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: false
    },
    update_date_time: {
        type: Date,
        required: false
    },
    update_employee_id: { 
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: false
    }
  });
  
  const DeliverOption = model('DeliverOption', DeliverOptionSchema);
  export default DeliverOption;
