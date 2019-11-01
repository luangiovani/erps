import { Schema, model } from 'mongoose';

const OperationLogSchema = new Schema({
    employee_id: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    begin_date_time: {
        type: Date,
        required: true
    },
    end_date_time: {
        type: Date,
        required: false
    },
    operation: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: false
    },
    error: {
        type: String,
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
  
  export default model('OperationLog', OperationLogSchema);