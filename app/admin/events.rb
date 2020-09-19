ActiveAdmin.register Event do
  permit_params :name, :img,:introduction,:flow,:point,:category, event_profiles_attributes: [:title, :content] , event_schedules_attributes: [:title,:start_time,:end_time,:place,:address,:deadline,:holding_day]
  menu label: "イベント一覧"
  filter :name, label:"タイトル"
  filter :category,as: :select, label:"カテゴリー"
  filter :event_schedules_deadline,as: :date_range, label:"申込期日"
  filter :event_schedules_place, as: :string, label:"開催場所"
  filter :event_schedules_holding_day, as: :string, label:"開催日"
  
  index do
    column :id do |event|
      link_to event.id, admin_event_path(event)
    end
    column :タイトル do |event|
      link_to event.name, admin_event_path(event)
    end
    column :カテゴリー do |event|
      link_to event.category, admin_event_path(event)
    end
  end
  form do |f|
    f.inputs 'Event' do
      f.input :name, label:"イベント名"
      f.input :img, as: :dropzone, label:"イベント画像"
      f.input :category, label:"カテゴリー"
      f.input :introduction, as: :quill_editor, input_html: { data: { options: { modules: {toolbar: [['bold', 'italic', 'underline', 'strike'],  ['blockquote', 'code-block'],[{ 'header': 1 }, { 'header': 2 }],  [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], [{ 'indent': '-1'}, { 'indent': '+1' }], [{ 'direction': 'rtl' }],   [{ 'size': ['small', false, 'large', 'huge'] }],[{ 'header': [1, 2, 3, 4, 5, 6, false] }],[{ 'color': [] }, { 'background': [] }],  [{ 'font': [] }],[{ 'align': [] }],['clean']  ,["link"]      ] }, placeholder: 'Type something...', theme: 'snow' } } }, label:"概要"
      f.input :flow, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline', 'strike'],  ['blockquote', 'code-block'],[{ 'header': 1 }, { 'header': 2 }],  [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], [{ 'indent': '-1'}, { 'indent': '+1' }], [{ 'direction': 'rtl' }],   [{ 'size': ['small', false, 'large', 'huge'] }],[{ 'header': [1, 2, 3, 4, 5, 6, false] }],[{ 'color': [] }, { 'background': [] }],  [{ 'font': [] }],[{ 'align': [] }],['clean']  ,["link"]      ] }, placeholder: 'Type something...', theme: 'snow' } } }, label:"当日の流れ"
      f.input :point, as: :quill_editor, input_html: { data: { options: { modules: { toolbar: [['bold', 'italic', 'underline', 'strike'],  ['blockquote', 'code-block'],[{ 'header': 1 }, { 'header': 2 }],  [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], [{ 'indent': '-1'}, { 'indent': '+1' }], [{ 'direction': 'rtl' }],   [{ 'size': ['small', false, 'large', 'huge'] }],[{ 'header': [1, 2, 3, 4, 5, 6, false] }],[{ 'color': [] }, { 'background': [] }],  [{ 'font': [] }],[{ 'align': [] }],['clean']  ,["link"]      ] }, placeholder: 'Type something...', theme: 'snow' } } }, label:"ポイント"
      f.inputs do
        f.has_many :event_profiles do |t|
          t.input :title, label:"タイトル"
          t.input :content, as: :quill_editor, input_html: { data: { options: { modules: {toolbar: [['bold', 'italic', 'underline', 'strike'],  ['blockquote', 'code-block'],[{ 'header': 1 }, { 'header': 2 }],  [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], [{ 'indent': '-1'}, { 'indent': '+1' }], [{ 'direction': 'rtl' }],   [{ 'size': ['small', false, 'large', 'huge'] }],[{ 'header': [1, 2, 3, 4, 5, 6, false] }],[{ 'color': [] }, { 'background': [] }],  [{ 'font': [] }],[{ 'align': [] }],['clean']  ,["link"]      ] }, placeholder: 'Type something...', theme: 'snow' } } }, label:"内容"
        end
      end
      f.inputs do
        f.has_many :event_schedules do |t|
          t.input :title, label:"イベントスケジュール名"
          t.input :start_time, label:"開始時間"
          t.input :end_time, label:"終了時間"
          t.input :place, label:"住所1"
          t.input :address, label:"住所2"
          t.input :deadline, label:"締め切り"
          t.input :holding_day, label:"開催日"
        end
      end
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :img, :introduction, :point, :flow, :category, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :img, :introduction, :point, :flow, :category, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
