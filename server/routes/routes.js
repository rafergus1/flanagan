const express = require('express');
const appController = require('../controllers/appController');

const router = express.Router();

router.get('/', appController.homepage);
router.get('/recipes', appController.recipes);
router.post('/recipes', appController.recipes);
router.get('/recipe-details', appController.recipeDetails);
router.get('/submit-recipe', appController.submitRecipe);
router.post('/submit-recipe', appController.submitRecipeOnPost);
router.get('/tastings', appController.tastings);
router.post('/tastings', appController.tastings);

module.exports = router;
