import { Schema, model } from 'mongoose';

const FundsHistorySchema = new Schema({
    employee_id: { 
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: false
    },
    funds: {
        type: Number,
        required: true
    },
    received_date: {
        type: Date,
        required: true
    },
    notes: {
        type: String,
        required: true
    },
    currency: {
        type: Number,
        required: false
    },
    rate: {
        type: Number,
        required: false
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
  
const FundsHistory = model('FundsHistory', FundsHistorySchema);
export default FundsHistory;