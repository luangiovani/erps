import { Schema, model } from 'mongoose';

const CreditsProductsExchangeSchema = new Schema({
    status: {
        type: Schema.Types.ObjectId,
        ref: 'StatusValues',
        required: true
    },
    employee: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    employee_store: {
        type: Schema.Types.ObjectId,
        ref: 'Employee',
        required: true
    },
    product: {
        type: Schema.Types.ObjectId,
        ref: 'Product',
        required: true
    },
    product_name: { 
        type: String, 
        required: true
    },
    product_description: { 
        type: String, 
        required: true
    },
    product_credits: { 
        type: Number, 
        required: false
    },
    product_currency: { 
        type: Number, 
        required: false
    },
    notes: { 
        type: String, 
        required: false
    },
    credits_total: { 
        type: Number, 
        required: false
    },
    currency_total: { 
        type: Number, 
        required: false
    },
    rate: { 
        type: Number, 
        required: false
    },
    justify: { 
        type: String, 
        required: false
    },
    store: {
        type: Schema.Types.ObjectId,
        ref: 'Store',
        required: false
    },
    additional_informations: { 
        type: String, 
        required: false
    },
    deliver_option: {
        type: Schema.Types.ObjectId,
        ref: 'DeliverOption',
        required: true
    },
    label: { 
        type: String, 
        required: false
    },
    label_employee: { 
        type: String, 
        required: false
    },
    label_store: { 
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
  
  const CreditsProductsExchange = model('CreditsProductsExchange', CreditsProductsExchangeSchema);
  export default CreditsProductsExchange;
