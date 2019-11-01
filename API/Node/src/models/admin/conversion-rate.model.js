import { Schema, model } from 'mongoose';

const ConversionRateSchema = new Schema({
    currency: {
        type: Number,
        required: true
    },
    rate: {
        type: Number,
        required: true
    },
    name: {
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
  
  export default model('ConversionRate', ConversionRateSchema);