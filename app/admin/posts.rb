include ApplicationHelper
ActiveAdmin.register Post do
  index do
    column :id
    column "userName",:name
    column :title,:sortable => :title do |post|
      link_to post.title, admin_post_path(post)
    end
    column :content
    #actions do |post|
    #  link_to "Preview", admin_preview_post_path(post), :class => "member_link"
    #end

    column do |post|
      link_to_clone post
    end
    default_actions
  end

  show do
    #h3 post.title
    #div do
    #  simple_format post.content
    #end

    attributes_table do
      row :title
      row :content
    end
    active_admin_comments

  end

  #form do |f|
  #  f.inputs "Details" do
  #    f.input :name, :label => "userName"
  #    f.input :title
  #  end
  #  f.inputs "Content" do
  #    f.input :content
  #  end
  #  f.actions
  #end

  form :partial => "form"
  #form partial: "form"

end
