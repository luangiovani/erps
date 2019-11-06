import { Schema, model } from 'mongoose';

const WorkLocationSchema = new Schema({
    name: { 
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
  
  const WorkLocation = model('WorkLocation', WorkLocationSchema);
  export default WorkLocation;