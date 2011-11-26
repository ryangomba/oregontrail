require 'test_helper'

class TraderTest < ActiveSupport::TestCase

    def setup
        @tp = traders(:traveling_party)
    end
    
    def teardown
        @tp = nil
    end

    test "validation" do
        new_tp = TravelingParty.new
        assert !new_tp.save, 'saved without speed, ration, or leader'
        new_tp.speed = 0
        assert !new_tp.save, 'saved without ration or leader'
        new_tp.ration = 0
        assert !new_tp.save, 'saved without leader'
        new_tp.create_leader(name: 'Ryan', profession: 'Farmer')
        assert new_tp.save, "save failed: #{@tp.errors.inspect}"
    end
    
    test "creation" do
        assert @tp, 'no traveling party created'
        assert @tp.followers.count > 0, 'problem creating followers'
    end
    
    test "fill" do
        assert @tp.items.oxen.count == 2
        assert @tp.items.wheels.count == 4
        assert @tp.items.axles.count == 2
        assert @tp.items.tongues.count == 1
    end
    
    test "money" do
        assert @tp.money == @tp.leader.money
    end
    
    test "people" do
        assert @tp.people == @tp.followers.count + 1
    end
    
    test "capacity" do
        c = WAGON_CAPACITY - 4 * Wheel.weight - 2 * Axle.weight - Tongue.weight
        assert @tp.capacity == c, "traveling capacity is wrong (#{@tp.capacity} when #{c})"
        assert @tp.save, "save failed: #{@tp.errors.inspect}"
    end
    
    test "ready" do
        assert @tp.ready == true, 'should be ready upon creation'
        @tp.items.sample.destroy
        assert @tp.ready == false, 'should not be ready after a critical item is destroyed'
    end
    
    test "break_down" do
        @tp.break_down
        assert @tp.ready == false, 'should not be ready after a critical item is destroyed'
    end
    
    test "kill_member" do
        num_followers = @tp.followers.count
        num_followers.times do
            @tp.kill_member
            assert @tp.followers.count == num_followers -= 1, "follower wasn't killed"
        end
        @tp.kill_member
        assert @tp.leader.destroyed?, "leader wasn't killed (#{@tp.followers.count} followers)"
    end

end
