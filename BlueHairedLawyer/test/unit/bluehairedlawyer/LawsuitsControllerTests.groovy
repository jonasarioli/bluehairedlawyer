package bluehairedlawyer



import org.junit.*
import grails.test.mixin.*

/**
 * LawsuitsControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LawsuitsController)
@Mock(Lawsuits)
class LawsuitsControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lawsuits/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lawsuitsInstanceList.size() == 0
        assert model.lawsuitsInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.lawsuitsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lawsuitsInstance != null
        assert view == '/lawsuits/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lawsuits/show/1'
        assert controller.flash.message != null
        assert Lawsuits.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lawsuits/list'


        populateValidParams(params)
        def lawsuits = new Lawsuits(params)

        assert lawsuits.save() != null

        params.id = lawsuits.id

        def model = controller.show()

        assert model.lawsuitsInstance == lawsuits
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lawsuits/list'


        populateValidParams(params)
        def lawsuits = new Lawsuits(params)

        assert lawsuits.save() != null

        params.id = lawsuits.id

        def model = controller.edit()

        assert model.lawsuitsInstance == lawsuits
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lawsuits/list'

        response.reset()


        populateValidParams(params)
        def lawsuits = new Lawsuits(params)

        assert lawsuits.save() != null

        // test invalid parameters in update
        params.id = lawsuits.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lawsuits/edit"
        assert model.lawsuitsInstance != null

        lawsuits.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lawsuits/show/$lawsuits.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lawsuits.clearErrors()

        populateValidParams(params)
        params.id = lawsuits.id
        params.version = -1
        controller.update()

        assert view == "/lawsuits/edit"
        assert model.lawsuitsInstance != null
        assert model.lawsuitsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lawsuits/list'

        response.reset()

        populateValidParams(params)
        def lawsuits = new Lawsuits(params)

        assert lawsuits.save() != null
        assert Lawsuits.count() == 1

        params.id = lawsuits.id

        controller.delete()

        assert Lawsuits.count() == 0
        assert Lawsuits.get(lawsuits.id) == null
        assert response.redirectedUrl == '/lawsuits/list'
    }
}
