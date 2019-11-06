import { verify } from 'jsonwebtoken';
import { findOne } from '../models/admin/employee.model';

const auth = async(req, res, next) => {
    const token = req.header('Authorization').replace('Bearer ', '')
    const data = verify(token, process.env.JWT_KEY)
    try {
        const employee = await findOne({ _id: data._id, 'tokens.token': token })
        if (!employee) {
            throw new Error()
        }
        req.employee = employee
        req.token = token
        next()
    } catch (error) {
        res.status(401).send({ error: 'Not authorized to access this resource' })
    }

}
export default auth