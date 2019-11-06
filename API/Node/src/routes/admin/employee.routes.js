import { Router } from 'express';
import Employee from '../../models/admin/employee.model';

const router = Router();

router.post('/employees', async (req, res) => {
    // Create a new employee
    try {
        const employee = new Employee(req.body);
        await employee.save();
        const token = await employee.generateAuthToken();
        res.status(201).send({ employee, token });
    } catch (error) {
        res.status(400).send(error);
    }
});

router.post('/employees/login', async(req, res) => {
    //Login a registered employee
    try {
        const { email, password } = req.body;
        const employee = await employee.findByCredentials(email, password);
        if (!employee) {
            return res.status(401).send({error: 'Login failed! Check authentication credentials'});
        }
        const token = await employee.generateAuthToken();
        res.send({ employee, token });
    } catch (error) {
        res.status(400).send(error);
    }
});

router.get('/employees/me', auth, async(req, res) => {
    // View logged in employee profile
    res.send(req.employee);
});

router.post('/employees/me/logout', auth, async (req, res) => {
    // Log employee out of the application
    try {
        req.employee.tokens = req.employee.tokens.filter((token) => {
            return token.token != req.token;
        })
        await req.employee.save();
        res.send();
    } catch (error) {
        res.status(500).send(error);
    }
})

router.post('/employees/me/logoutall', auth, async(req, res) => {
    // Log employee out of all devices
    try {
        req.employee.tokens.splice(0, req.employee.tokens.length);
        await req.employee.save();
        res.send();
    } catch (error) {
        res.status(500).send(error);
    }
})

export default router;