import { Schema, model } from 'mongoose';

const StatusValuesSchema = new Schema({
    desription: {
        type: String,
        required: true
    },
    status_types: {
        type: Schema.Types.ObjectId,
        ref: 'StatusTypes',
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
  
  const StatusValues = model('StatusValues', StatusValuesSchema);
  export default StatusValues;