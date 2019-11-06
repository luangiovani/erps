import { Schema, model } from 'mongoose';

const RoleNavigationMenusSchema = new Schema({
    role: {
        type: Schema.Types.ObjectId,
        ref: 'Role',
        required: true
    },
    navigation_menu: {
        type: Schema.Types.ObjectId,
        ref: 'NavigationMenu',
        required: true
    },
    can_view: {
        type: Boolean,
        required: false
    },
    can_edit: {
        type: Boolean,
        required: true
    },
    can_delete: {
        type: Boolean,
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
  
  const RoleNavigationMenus = model('RoleNavigationMenus', RoleNavigationMenusSchema);
  export default RoleNavigationMenus;