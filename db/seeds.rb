# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# storing to variables, in order to capture ids for associated models


# create a user w/ id of one by signing up via devise and put the id in the @user_id variable:
@user_id = 1

# create projects for the user, and store the projects' ids in an array:
@project_ids = []
3.times do 
    @project = Project.create(
        name: Faker::Book.title, 
        user_id: @user_id
        )
    @project_ids.push(@project.id)
end

# create tasks to belong to each of the projects that were made
@project_ids.each do |project_id|
    @level_one_sequence = 1
    10.times do
        @task = Task.create(
            name:Faker::Hipster.word,
            content:Faker::Hipster.sentence(2),
            sequence: @level_one_sequence,
            project_id: project_id,
            task_id: nil
        )
        @level_one_sequence += 1
        # create sub-tasks for the parent task
        @parent_task_id_one_deep = @task.id
        @level_two_sequence = 1
        5.times do
            @task = Task.create(
                name:Faker::Hipster.word,
                content:Faker::Hipster.sentence(2),
                sequence: @level_two_sequence,
                task_id: @parent_task_id_one_deep,
                project_id: nil
            )
            @level_two_sequence += 1
            @parent_task_id = @task.id
            @level_three_sequence = 1
            5.times do
                @task = Task.create(
                name:Faker::Hipster.word,
                content:Faker::Hipster.sentence(2),
                sequence: @level_three_sequence,
                task_id: @parent_task_id,
                project_id: nil
            )
            @level_three_sequence += 1
            end
        end
    end
end


# @level_three_sequence = 1
#             5.times do
#                 @task = Task.create(
#                 name:Faker::Hipster.word,
#                 content:Faker::Hipster.sentence(2),
#                 sequence: @level_three_sequence,
#                 task_id: @parent_task_id,
#                 project_id: nil
#             )
#             @level_three_sequence += 1
#             end



# create 20 tags
# @tag_ids = []
# 20.times do 
#     @new_tag = Tag.create({
#         name: Faker::Hipster.word
#     })
#     @tag_ids.push(@new_tag.id)
# end


# rails aborted!
# NoMethodError: undefined method `id' for #<Array:0x00007fbf69994168>
# def assosciate_tags_to_stickis(tag_ids, starting_id)
#     unique_tag_ids = {}
#     3.times do
#         random_tag_id = tag_ids[rand(tag_ids.length)]
#         while(unique_tag_ids[random_tag_id])
#             random_tag_id = tag_ids[rand(tag_ids.length)]
#             unique_tag_ids[random_tag_id] = true
#         end
#         StickisTag.create(
#             tag_id: random_tag_id,
#             sticki_id: model_instance.id
#         )
#     end
# end


# create 50 stickis for each project:
# @project_id = @project_ids[0]
# @project_count = @project_ids.length
# @project_count.times do
#     50.times do
#         @sticki = Sticki.create([
#             name: Faker::Hipster.word,
#             content: Faker::Hipster.sentence(2),
#             project_id: @project_id
#         ])
#         # p "@sticki"
#         # p @sticki[id]
#         assosciate_tags_to_stickis(@tag_ids, @sticki)
#     end
#     @project_id += 1
# end





# def assosciate_tags_to_tasks(tag_ids, model_instance)
#     unique_tag_ids = {}
#     3.times do
#         random_tag_id = tag_ids[rand(tag_ids.length)]
#         while(unique_tag_ids[random_tag_id])
#             random_tag_id = tag_ids[rand(tag_ids.length)]
#             unique_tag_ids[random_tag_id] = true
#         end
#         TagsTask.create(
#             tag_id: random_tag_id,
#             task_id: model_instance.id
#         )
#     end
# end



# create Tasks for each of the three projects @project_id defined above:
# only the @task with task_id: nil needs to have a project_id assigned:
# @starting_project_id = @project_ids[0]
# @task_count = 0
# 3.times do
#     5.times do 
#         @parent_id = nil
#         @task = Task.create(
#             task_id: @parent_id, 
#             content: Faker::Hipster.sentence(2),
#             project_id: @project_id
#             )
#         assosciate_tags_to_tasks(@tag_ids, @task)
#         @parent_id = @task.id
#         5.times do 
#             @task = Task.create(task_id: @parent_id, content: Faker::Hipster.sentence(2))
#             @parent_id = @task.id
#             assosciate_tags_to_tasks(@tag_ids, @task)
#             5.times do 
#                 @task = Task.create(task_id: @parent_id, content: Faker::Hipster.sentence(2))
#                 assosciate_tags_to_tasks(@tag_ids, @task)
#             end
#         end
#     end
#     @project_id += 1;
#     # to do: look up modulus operator in ruby
#     if(@project_id > @starting_project_id + @project_ids.length) 
#         @project_id -= @project_ids.length
#     end
# end






