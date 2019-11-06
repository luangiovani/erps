import { Schema, model } from 'mongoose';

const RecommendationTypeSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: false
    },
    type: {
        type: Number,
        required: true
    },
    fixed_score: {
        type: Number,
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
  
  const RecommendationType = model('RecommendationType', RecommendationTypeSchema);
  export default RecommendationType;