import { Schema, model } from 'mongoose';

const OperationTransactionsLogSchema = new Schema({
    operation_log_id: {
        type: Schema.Types.ObjectId,
        ref: 'OperationLog',
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
    transaction: {
        type: String,
        required: true
    },
    description: {
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
  
  const OperationTransactionsLog = model('OperationTransactionsLog', OperationTransactionsLogSchema);
  export default OperationTransactionsLog;