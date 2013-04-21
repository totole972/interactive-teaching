package interactive.teaching



import org.junit.*
import grails.test.mixin.*

@TestFor(Question_AnswerController)
@Mock(Question_Answer)
class Question_AnswerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/question_Answer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.question_AnswerInstanceList.size() == 0
        assert model.question_AnswerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.question_AnswerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.question_AnswerInstance != null
        assert view == '/question_Answer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/question_Answer/show/1'
        assert controller.flash.message != null
        assert Question_Answer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/question_Answer/list'

        populateValidParams(params)
        def question_Answer = new Question_Answer(params)

        assert question_Answer.save() != null

        params.id = question_Answer.id

        def model = controller.show()

        assert model.question_AnswerInstance == question_Answer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/question_Answer/list'

        populateValidParams(params)
        def question_Answer = new Question_Answer(params)

        assert question_Answer.save() != null

        params.id = question_Answer.id

        def model = controller.edit()

        assert model.question_AnswerInstance == question_Answer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/question_Answer/list'

        response.reset()

        populateValidParams(params)
        def question_Answer = new Question_Answer(params)

        assert question_Answer.save() != null

        // test invalid parameters in update
        params.id = question_Answer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/question_Answer/edit"
        assert model.question_AnswerInstance != null

        question_Answer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/question_Answer/show/$question_Answer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        question_Answer.clearErrors()

        populateValidParams(params)
        params.id = question_Answer.id
        params.version = -1
        controller.update()

        assert view == "/question_Answer/edit"
        assert model.question_AnswerInstance != null
        assert model.question_AnswerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/question_Answer/list'

        response.reset()

        populateValidParams(params)
        def question_Answer = new Question_Answer(params)

        assert question_Answer.save() != null
        assert Question_Answer.count() == 1

        params.id = question_Answer.id

        controller.delete()

        assert Question_Answer.count() == 0
        assert Question_Answer.get(question_Answer.id) == null
        assert response.redirectedUrl == '/question_Answer/list'
    }
}
