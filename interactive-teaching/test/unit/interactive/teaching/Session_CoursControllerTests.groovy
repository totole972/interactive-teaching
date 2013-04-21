package interactive.teaching

import grails.test.mixin.*

@TestFor(Session_CoursController)
@Mock(Session_Cours)
class Session_CoursControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/session_Question/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.session_QuestionInstanceList.size() == 0
        assert model.session_QuestionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.session_QuestionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.session_QuestionInstance != null
        assert view == '/session_Question/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/session_Question/show/1'
        assert controller.flash.message != null
        assert Session_Cours.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/session_Question/list'

        populateValidParams(params)
        def session_Question = new Session_Cours(params)

        assert session_Question.save() != null

        params.id = session_Question.id

        def model = controller.show()

        assert model.session_QuestionInstance == session_Question
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/session_Question/list'

        populateValidParams(params)
        def session_Question = new Session_Cours(params)

        assert session_Question.save() != null

        params.id = session_Question.id

        def model = controller.edit()

        assert model.session_QuestionInstance == session_Question
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/session_Question/list'

        response.reset()

        populateValidParams(params)
        def session_Question = new Session_Cours(params)

        assert session_Question.save() != null

        // test invalid parameters in update
        params.id = session_Question.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/session_Question/edit"
        assert model.session_QuestionInstance != null

        session_Question.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/session_Question/show/$session_Question.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        session_Question.clearErrors()

        populateValidParams(params)
        params.id = session_Question.id
        params.version = -1
        controller.update()

        assert view == "/session_Question/edit"
        assert model.session_QuestionInstance != null
        assert model.session_QuestionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/session_Question/list'

        response.reset()

        populateValidParams(params)
        def session_Question = new Session_Cours(params)

        assert session_Question.save() != null
        assert Session_Cours.count() == 1

        params.id = session_Question.id

        controller.delete()

        assert Session_Cours.count() == 0
        assert Session_Cours.get(session_Question.id) == null
        assert response.redirectedUrl == '/session_Question/list'
    }
}
