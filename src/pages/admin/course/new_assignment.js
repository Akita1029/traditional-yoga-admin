import React, { useState } from "react"
import { MetaTags } from "react-meta-tags";
import { Card, CardBody, CardHeader, Col, Container, Input, Label, Row } from "reactstrap";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import Flatpickr from "react-flatpickr";
import Dropzone from "react-dropzone";
import { Link } from "react-router-dom/cjs/react-router-dom.min";
import Select from "react-select";
import { DurationParamPicker, SwitchEx } from "../common/components";

const NewAssignment = () => {
    const SingleOptions = [
        { value: 'Watches', label: 'Watches' },
        { value: 'Headset', label: 'Headset' },
        { value: 'Sweatshirt', label: 'Sweatshirt' },
        { value: '20% off', label: '20% off' },
        { value: '4 star', label: '4 star' },
      ];
    const [courseDuration, setCourseDuration] = useState(5);
    const [courseMaxStudent, setCourseMaxStudent] = useState(5);
    const [coursePassingPercentage, setCoursePassingPercentage] = useState(100);
    const [courseDripFeedDuration, setCourseDripFeedDuration] = useState(0);
    const [courseDurationParam, setCourseDurationParam] = useState("months");
    const [dripdurationParam, setDripdurationParam] = useState("days");

    function countUP(id, prev_data_attr) {
      id(prev_data_attr + 1);
    }
  
    function countDown(id, prev_data_attr) {
      id(prev_data_attr - 1);
    }
  
    const [selectedFiles, setselectedFiles] = useState([]);
    const [files, setFiles] = useState([]);
    const [selectedMulti, setselectedMulti] = useState(null);

    function handleAcceptedFiles(files) {
      files.map(file =>
        Object.assign(file, {
          preview: URL.createObjectURL(file),
          formattedSize: formatBytes(file.size),
        })
      );
      setselectedFiles(files);
    }

    /**
     * Formats the size
     */
    function formatBytes(bytes, decimals = 2) {
        if (bytes === 0) return "0 Bytes";
        const k = 1024;
        const dm = decimals < 0 ? 0 : decimals;
        const sizes = ["Bytes", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + " " + sizes[i];
    }

    function handleMulti(selectedMulti) {
        setselectedMulti(selectedMulti);
    }  

    return (
        
        <React.Fragment>
            <div className="page-content">
                <MetaTags>
                    <title>Create Course</title>
                </MetaTags>
                <Container fluid>
                    <Row>
                        <Col lg={8}>
                            <Card>
                                <CardBody>
                                    <div className="mb-3">
                                        <Label className="form-label" htmlFor="course-title-input">Course Title</Label>
                                        <Input type="text" className="form-control" id="course-title-input"
                                            placeholder="Enter course title" />
                                    </div>

                                    <div className="mb-3">
                                        <Label className="form-label">Project Description</Label>
                                        <CKEditor
                                            editor={ClassicEditor}
                                            data="<p>Hello from CKEditor 5!</p>"
                                            onReady={(editor) => {
                                                // You can store the "editor" and use when it is needed.
                                                
                                            }}
                                            onChange={(editor) => {
                                                editor.getData();
                                            }}
                                            />
                                    </div>

                                    <Row>
                                        <Col lg={4} sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="course-duration-spin" className="form-label">Course Duration</Label>
                                                <div className="input-step step-primary full-width" id="course-duration-spin">
                                                    <button
                                                        type="button"
                                                        className="minus"
                                                        onClick={() => {
                                                        countDown(setCourseDuration, courseDuration);
                                                        }}
                                                    >
                                                        –
                                                    </button>
                                                    <Input
                                                        type="number"
                                                        className="product-quantity"
                                                        value={courseDuration}
                                                        min="0"
                                                        max="100"
                                                        readOnly
                                                    />
                                                    <button
                                                        type="button"
                                                        className="plus"
                                                        onClick={() => {
                                                        countUP(setCourseDuration, courseDuration);
                                                        }}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                        </Col>
                                        <Col lg={4} sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="choices-duration-param-input" className="form-label">Duration Param</Label>
                                                <DurationParamPicker onParamChanged={setCourseDurationParam} value={courseDurationParam} id="choices-duration-param-input"/>
                                            </div>
                                        </Col>
                                        <Col lg={4}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label className="form-label" htmlFor="course-student-input">Student Number</Label>
                                                <Input type="text" className="form-control" id="course-student-input"
                                                    placeholder="Enter total number of students in course" />
                                            </div>
                                        </Col>
                                    </Row>

                                    <SwitchEx title="Unit Completion Lock" summary="Previews Units/Quiz must be Completed before next unit/quiz access"/>
                                    <SwitchEx title="Offline Course" summary="Make this an Offline Course"/>
                                    <SwitchEx title="Show Unit content in Curriculum" summary="Display units content in Course Curriculum, unit content visible in curriculum.(Recommended for Offline Courses.)"/>
                                    <SwitchEx title="Hide Course Button after subscription" summary="Hide Start Course/Continue Course button after Course is subscribed by user.(Recommended for Offline Courses.)"/>
                                    <SwitchEx title="Display Course Progress on Course home" summary="Display User Course progress on Course page.(Recommended for Offline Coourses.)"/>
                                    <SwitchEx title="Time based course progress" summary="Automatically generate course progress based on duration(number of months/weeks/days/hours) passed in course. (Recommended for Offline Courses.)"/>
                                    <SwitchEx title="Post Course Reviews from Course Home" summary="Allow subscribed users to post course reviews from Course home page.(Recommended for Offline Courses.)"/>
                                    <SwitchEx title="Auto Evaluation" summary="Evaluate courses based on Quizzes scores available in Course(*Requires at lst 1 Quiz in course)"/>

                                    <Row className="mt-3">
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label className="form-label" htmlFor="course-start-date">Course Start Date</Label>
                                                <Flatpickr
                                                placeholder="Select course start date"
                                                className="form-control bg-light border-light"
                                                options={{
                                                    mode: "single",
                                                    dateFormat: "d M, Y"
                                                }}
                                                />
                                            </div>
                                        </Col>
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="course-max-student-spin" className="form-label">Max Students in Course</Label>
                                                <div className="input-step step-primary full-width" id="course-max-student-spin">
                                                    <button
                                                        type="button"
                                                        className="minus"
                                                        onClick={() => {
                                                        countDown(setCourseMaxStudent, courseMaxStudent);
                                                        }}
                                                    >
                                                        –
                                                    </button>
                                                    <Input
                                                        type="number"
                                                        className="product-quantity"
                                                        value={courseMaxStudent}
                                                        min="0"
                                                        max="100"
                                                        readOnly
                                                    />
                                                    <button
                                                        type="button"
                                                        className="plus"
                                                        onClick={() => {
                                                        countUP(setCourseMaxStudent, courseMaxStudent);
                                                        }}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                        </Col>
                                    </Row>
                                    <SwitchEx title="Completion Certificate" summary="Enable Certificate image which Students receive upon course completion.(out of 100)"/>
                                    <Row className="mt-3">
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label className="form-label" htmlFor="course-start-date">Certificate Template</Label>
                                            </div>
                                        </Col>
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="course-duration-spin" className="form-label">Passing Percentage</Label>
                                                <div className="input-step step-primary full-width" id="course-duration-spin">
                                                    <button
                                                        type="button"
                                                        className="minus"
                                                        onClick={() => {
                                                        countDown(setCoursePassingPercentage, coursePassingPercentage);
                                                        }}
                                                    >
                                                        –
                                                    </button>
                                                    <Input
                                                        type="number"
                                                        className="product-quantity"
                                                        value={coursePassingPercentage}
                                                        min="0"
                                                        max="100"
                                                        readOnly
                                                    />
                                                    <button
                                                        type="button"
                                                        className="plus"
                                                        onClick={() => {
                                                        countUP(setCoursePassingPercentage, coursePassingPercentage);
                                                        }}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                        </Col>
                                    </Row>
                                    <SwitchEx title="Drip Feed" summary="Enable Drip Feed course"/>
                                    <SwitchEx title="Course Starting Time as Drip Feed Origin" summary="Drip feed time calcuation from Course starting date/time vs previous unit access date/time(default)"/>
                                    <SwitchEx title="Section Drip Feed" summary="Enable Section Drip Feed (default) course"/>
                                    <SwitchEx title="Drip Duration as Unit Duration" summary="Assume Drip duration same as Unit Duration. duration between consecutive units."/>

                                    <Row>
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="course-duration-spin" className="form-label">Drip Feed Duration(Static)</Label>
                                                <div className="input-step step-primary full-width" id="course-duration-spin">
                                                    <button
                                                        type="button"
                                                        className="minus"
                                                        onClick={() => {
                                                        countDown(setCourseDripFeedDuration, courseDripFeedDuration);
                                                        }}
                                                    >
                                                        –
                                                    </button>
                                                    <Input
                                                        type="number"
                                                        className="product-quantity"
                                                        value={courseDripFeedDuration}
                                                        min="0"
                                                        max="100"
                                                        readOnly
                                                    />
                                                    <button
                                                        type="button"
                                                        className="plus"
                                                        onClick={() => {
                                                        countUP(setCourseDripFeedDuration, courseDripFeedDuration);
                                                        }}
                                                    >
                                                        +
                                                    </button>
                                                </div>
                                            </div>
                                        </Col>
                                        <Col sm={6}>
                                            <div className="mb-3 mb-lg-0">
                                                <Label htmlFor="choices-duration-param-input" className="form-label">Drip Duration Param</Label>
                                                <DurationParamPicker onParamChanged={setDripdurationParam} value={dripdurationParam} id="choices-duration-param-input"/>
                                            </div>
                                        </Col>
                                    </Row>
                                </CardBody>
                            </Card>
                            <Card>
                                <CardHeader >
                                    <h5 className="card-title mb-0">Attached files</h5>
                                </CardHeader>
                                <CardBody>
                                    <div>
                                        <p className="text-muted">Add Attached files here.</p>

                                        <Dropzone
                                            onDrop={acceptedFiles => {
                                            handleAcceptedFiles(acceptedFiles);
                                            }}
                                        >
                                            {({ getRootProps, getInputProps }) => (
                                            <div className="dropzone dz-clickable">
                                                <div
                                                className="dz-message needsclick"
                                                {...getRootProps()}
                                                >
                                                <div className="mb-3">
                                                    <i className="display-4 text-muted ri-upload-cloud-2-fill" />
                                                </div>
                                                <h5>Drop files here or click to upload.</h5>
                                                </div>
                                            </div>
                                            )}
                                        </Dropzone>

                                        <ul className="list-unstyled mb-0" id="dropzone-preview">
                                        
                                        {selectedFiles.map((f, i) => {
                                            return (
                                                <Card
                                                className="mt-1 mb-0 shadow-none border dz-processing dz-image-preview dz-success dz-complete"
                                                key={i + "-file"}
                                                >
                                                <div className="p-2">
                                                    <Row className="align-items-center">
                                                    <Col className="col-auto">
                                                        <img
                                                        data-dz-thumbnail=""
                                                        height="80"
                                                        className="avatar-sm rounded bg-light"
                                                        alt={f.name}
                                                        src={f.preview}
                                                        />
                                                    </Col>
                                                    <Col>
                                                        <Link
                                                        to="#"
                                                        className="text-muted font-weight-bold"
                                                        >
                                                        {f.name}
                                                        </Link>
                                                        <p className="mb-0">
                                                        <strong>{f.formattedSize}</strong>
                                                        </p>
                                                    </Col>
                                                    </Row>
                                                </div>
                                                </Card>
                                            );
                                            })}
                                        </ul>

                                    </div>
                                </CardBody>
                            </Card>

                            <div className="text-end mb-4">
                                <button type="submit" className="btn btn-danger w-sm me-1">Delete</button>
                                <button type="submit" className="btn btn-secondary w-sm me-1">Draft</button>
                                <button type="submit" className="btn btn-success w-sm">Create</button>
                            </div>
                        </Col>

                        <Col lg={4}>
                            <div className="card">
                                <div className="card-header">
                                    <h5 className="card-title mb-0">Privacy</h5>
                                </div>
                                <CardBody>
                                    <div>
                                        <Label htmlFor="choices-privacy-status-input" className="form-label">Status</Label>
                                        <select className="form-select" data-choices data-choices-search-false
                                            id="choices-privacy-status-input">
                                            <option defaultValue="Private">Private</option>
                                            <option value="Team">Team</option>
                                            <option value="Public">Public</option>
                                        </select>
                                    </div>
                                </CardBody>
                            </div>

                            <div className="card">
                                <div className="card-header">
                                    <h5 className="card-title mb-0">Tags</h5>
                                </div>
                                <CardBody>
                                    <div className="mb-3">
                                        <Label htmlFor="choices-categories-input" className="form-label">Categories</Label>
                                        <select className="form-select" data-choices data-choices-search-false
                                            id="choices-categories-input">
                                            <option defaultValue="Designing">Designing</option>
                                            <option value="Development">Development</option>
                                        </select>
                                    </div>

                                    <div>
                                        <Label htmlFor="choices-text-input" className="form-label">Skills</Label>
                                        <Select
                                            value={selectedMulti}
                                            isMulti={true}                                                            
                                            onChange={() => {
                                                handleMulti();
                                            }}
                                            options={SingleOptions}
                                        />
                                    </div>
                                </CardBody>
                            </div>

                            <Card>
                                <CardHeader>
                                    <h5 className="card-title mb-0">Members</h5>
                                </CardHeader>
                                <CardBody>
                                    <div className="mb-3">
                                        <Label htmlFor="choices-lead-input" className="form-label">Team Lead</Label>
                                        <select className="form-select" data-choices data-choices-search-false
                                            id="choices-lead-input">
                                            <option defaultValue="Brent Gonzalez">Brent Gonzalez</option>
                                            <option value="Darline Williams">Darline Williams</option>
                                            <option value="Sylvia Wright">Sylvia Wright</option>
                                            <option value="Ellen Smith">Ellen Smith</option>
                                            <option value="Jeffrey Salazar">Jeffrey Salazar</option>
                                            <option value="Mark Williams">Mark Williams</option>
                                        </select>
                                    </div>

                                    <div>
                                        <Label className="form-label">Team Members</Label>
                                        <div className="avatar-group">
                                            <Link to="#" className="avatar-group-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Brent Gonzalez">
                                                <div className="avatar-xs">
                                                </div>
                                            </Link>
                                            <Link to="#" className="avatar-group-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Sylvia Wright">
                                                <div className="avatar-xs">
                                                    <div className="avatar-title rounded-circle bg-secondary">
                                                        S
                                                    </div>
                                                </div>
                                            </Link>
                                            <Link to="#" className="avatar-group-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Ellen Smith">
                                                <div className="avatar-xs">
                                                </div>
                                            </Link>
                                            <Link to="#" className="avatar-group-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Add Members">
                                                <div className="avatar-xs" data-bs-toggle="modal" data-bs-target="#inviteMembersModal">
                                                    <div className="avatar-title fs-16 rounded-circle bg-light border-dashed border text-primary">
                                                        +
                                                    </div>
                                                </div>
                                            </Link>
                                        </div>
                                    </div>
                                </CardBody>
                            </Card>
                        </Col>
                    </Row>
                </Container>
            </div>
        </React.Fragment>
    )
}

export default NewAssignment;