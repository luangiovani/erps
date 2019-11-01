import { Schema, model } from 'mongoose';

const RecommendationSchema = new Schema({
    employee: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    requester: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    recommendation: {
        type: Schema.Types.ObjectId,
        ref: 'RecommendationType',
        required: true
    },
    justify: { 
        type: String, 
        required: false
    },
    score: { 
        type: Number, 
        required: false
    },
    status: {
        type: Schema.Types.ObjectId,
        ref: 'StatusValues',
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
  
  export default model('Recommendation', RecommendationSchema);