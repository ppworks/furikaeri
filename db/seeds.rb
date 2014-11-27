if Project.count == 0
  project = FactoryGirl.create(:project_demo)
  FactoryGirl.create(:issue_demo, :problem, project: project)
  FactoryGirl.create(:issue_demo, :keep, project: project)
  FactoryGirl.create(:issue_demo, :try, project: project)
end
