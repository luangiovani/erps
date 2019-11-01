import { Schema, model } from 'mongoose';
import { validator } from 'validator';

const EmployeeSchema = new Schema({
    master_employee_id: { 
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: false
    },
    position_id: { 
        type: Schema.Types.ObjectId,
        ref: 'Position',
        required: true
    },
    role_id: { 
        type: Schema.Types.ObjectId,
        ref: 'Role',
        required: true
    },
    currency: {
        type: Number,
        required: true
    },
    rate: {
        type: Number,
        required: true
    },
    first_name: {
        type: String,
        required: true
    },
    middle_name: {
        type: String,
        required: true
    },
    last_name: {
        type: String,
        required: true
    },
    email: { 
        type: String, 
        required: true, 
        validate: (value) => { return validator.isEmail(value) } 
    },
    work_location: {
        type: String, 
        required: true
    },
    funds: {
        type: Number, 
        required: false
    },
    credits: {
        type: Number, 
        required: false
    },
    password: {
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
  
  export default model('Employee', EmployeeSchema);