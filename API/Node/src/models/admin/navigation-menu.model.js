import { Schema, model } from 'mongoose';

const NavigationMenuSchema = new Schema({
    top_menu_id: {
        type: Schema.Types.ObjectId,
        ref: 'NavigationMenu',
        required: false
    },
    label: {
      type: String,
      required: true
    },
    rank: {
        type: Number,
        required: false
    },
    controller: {
        type: String,
        required: false
    },
    action: {
        type: String,
        required: false
    },
    help: {
        type: String,
        required: false
    },
    icon: {
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
  
  const NavigationMenu = model('NavigationMenu', NavigationMenuSchema);
  export default NavigationMenu;