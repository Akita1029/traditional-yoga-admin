import React, { useMemo } from 'react';
import { MetaTags } from 'react-meta-tags';
import { Col, Container } from 'reactstrap';
import Flatpickr from "react-flatpickr";
import TableContainer from '../../../Components/Common/TableContainer';
import { useSelector } from 'react-redux';
import { Link } from 'react-router-dom/cjs/react-router-dom.min';
import { Author } from './courselist';

const Courses = () => {
    const { taskList } = useSelector((state) => ({
      taskList: state.Tasks.taskList,
    }));

    const columns = useMemo(
      () => [
        {
          Header: "#",
          Cell: () => {
            return <input type="checkbox" />;
          },
        },
        {
          Header: "Title",
          accessor: "title",
          filterable: false,
          Cell: (cellProps) => {
            return <div>{ cellProps.title }</div>;
          },
        },
        {
          Header: "Author",
          accessor: "author",
          filterable: false,
          Cell: (cellProps) => {
            return <Author {...cellProps} />;
          },
        },
        {
          Header: "Course Category",
          accessor: "courseCategory",
          filterable: false,
          Cell: (cellProps) => {
            return <div>{ cellProps.category }</div>;
          },
        },
        {
          Header: "Date",
          accessor: "date",
          filterable: false,
          Cell: (cellProps) => {
            return <div>{ cellProps.modified }</div>;
          },
        },
      ],
      []
    );

    return (
        <React.Fragment>
            <div className="page-content">
                <MetaTags>
                    <title>All Courses</title>
                </MetaTags>
                <Container fluid>
                    <div className="row">
                        <Col lg={12}>
                        <div className="card" id="tasksList">
                            <div className="card-header border-0">
                            <div className="d-flex align-items-center">
                                <h5 className="card-title mb-0 flex-grow-1">All Tasks</h5>
                                <div className="flex-shrink-0">
                                    <Link to="/courses/new">
                                        <button className="btn btn-danger add-btn"><i className="ri-add-line align-bottom me-1"></i> Create Course</button>
                                    </Link>
                                </div>
                            </div>
                            </div>
                            <div className="card-body border border-dashed border-end-0 border-start-0">
                            <form>
                                <div className="row g-3">
                                    <div className="col-xxl-5 col-sm-6">
                                        <div className="search-box">
                                        <input type="text" className="form-control search bg-light border-light" placeholder="Search for tasks or something..." />
                                        <i className="ri-search-line search-icon"></i>
                                        </div>
                                    </div>

                                    <div className="col-xxl-4 col-sm-2"/>

                                    <div className="col-xxl-3 col-sm-4">
                                        <Flatpickr
                                        placeholder="Select date range"
                                        className="form-control bg-light border-light"
                                        options={{
                                            mode: "range",
                                            dateFormat: "d M, Y"
                                        }}
                                        />
                                    </div>
                                </div>
                            </form>
                            </div>
                            <div className="card-body">
                            <TableContainer
                                columns={columns}
                                data={taskList}
                                isGlobalFilter={false}
                                isAddUserList={false}
                                customPageSize={8}
                                className="custom-header-css"
                                divclassName="table-responsive table-card mb-4"
                                tableclassName="align-middle table-nowrap mb-0"
                                theadclassName="table-light table-nowrap"
                                thclassName="table-light text-muted"
                            />
                            </div>
                        </div>
                        </Col>
                    </div>
                </Container>
            </div>
        </React.Fragment>
    )
}

export default Courses;