import { Schema, model } from 'mongoose';

const ProductsSchema = new Schema({
    name: { 
        type: String, 
        required: true
    },
    description: { 
        type: String, 
        required: true
    },
    image: { 
        type: String, 
        required: true
    },
    available: {
        type: Boolean,
        required: true
    },
    credits: {
        type: Number,
        required: true
    },
    currency: {
        type: Number,
        required: true
    },
    notes: { 
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
  
  const Products = model('Products', ProductsSchema);
  export default Products;