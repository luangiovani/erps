import { Schema, model } from 'mongoose';
import { validator } from 'validator';
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

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
    },
    tokens: [{
        token: {
            type: String,
            required: true
        }
    }]
  });
  
EmployeeSchema.pre('save', async function (next) {
    // Hash the password before saving the employee model
    const employee = this
    if (employee.isModified('password')) {
        employee.password = await bcrypt.hash(employee.password, 8)
    }
    next()
})

EmployeeSchema.methods.generateAuthToken = async function() {
    // Generate an auth token for the employee
    const employee = this
    const token = jwt.sign({_id: employee._id}, process.env.JWT_KEY)
    employee.tokens = employee.tokens.concat({token})
    await employee.save()
    return token
}

EmployeeSchema.statics.findByCredentials = async (email, password) => {
    // Search for a employee by email and password.
    const employee = await employee.findOne({ email })
    if (!employee) {
        throw new Error({ error: 'Invalid login credentials' })
    }
    const isPasswordMatch = await bcrypt.compare(password, employee.password)
    if (!isPasswordMatch) {
        throw new Error({ error: 'Invalid login credentials' })
    }
    return employee
}

const Employee = model('Employee', EmployeeSchema);
export default Employee;