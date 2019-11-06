import { Schema, model } from 'mongoose';

const EvaluationSchema = new Schema({
    recommendation: {
        type: Schema.Types.ObjectId,
        ref: 'Recommendation',
        required: true
    },
    evaluator_employee: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    status: {
        type: Schema.Types.ObjectId,
        ref: 'StatusValues',
        required: true
    },
    justify: { 
        type: String, 
        required: true
    },
    evaluation_date_time: { 
        type: Date, 
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
  
  const Evaluation = model('Evaluation', EvaluationSchema);
  export default Evaluation;
