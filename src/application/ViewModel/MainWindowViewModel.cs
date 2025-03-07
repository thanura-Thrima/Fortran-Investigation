using System.Collections.ObjectModel;
using WpfApp.Model;
using WpfApp.MVVM;

namespace WpfApp.ViewModel
{
    internal class MainWindowViewModel : ViewModelBase
    {
        public ObservableCollection<GeometryObject> GeometryObjects { get; set; }
        
        private GeometryObject m_selectedObject;
        public GeometryObject SelectedObject
        {
            get { return m_selectedObject; }
            set {
                m_selectedObject = value;
                onPropertyChanged();
            }
        }
        public MainWindowViewModel() {
            GeometryObjects = new ObservableCollection<GeometryObject>();
            GeometryObjects.Add(new GeometryObject { m_name = "Curve" });
            GeometryObjects.Add(new GeometryObject {m_name = "Trangle1" });
            GeometryObjects.Add(new GeometryObject {m_name = "Trangle2" });
            GeometryObjects.Add(new GeometryObject {m_name = "Trangle3" });
            GeometryObjects.Add(new GeometryObject {m_name = "rectangle" });
        }
    }
}
